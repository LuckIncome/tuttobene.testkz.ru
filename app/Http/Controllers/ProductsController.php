<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Cake;
use App\Models\District;
use App\Models\Icecream;
use App\Models\IceType;
use App\Models\Order;
use App\Models\Page;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
    public function category($category, $type = null)
    {
        if (!in_array($category, [Icecream::ICECREAM, Icecream::CAKE])) {
            abort(404);
        }
        if ($category === Icecream::ICECREAM) {
            return $this->icecreamsPage($category, $type);
        }
        if ($category === Icecream::CAKE) {
            return $this->cakesPage($category);
        }

    }

    public function icecreamsPage($category, $type)
    {
        if (is_null($type)) {
            $category = IceType::where('status', true)->orderBy('sort_id')->first();
        } else {
            if ($type !== 'popular') {
                $category = IceType::where('slug', $type)->where('status', true)->firstOrFail();
            } else {
                $category = $type;
            }
        }

        $products = Icecream::with('defaultPortion')->where('status', true);
        if ($type === 'popular') {
            $products = $products->where('featured', true);
        } else {
            $products = $products->where('type_id', $category->id);
        }
        $products = $products->orderBy('sort_id')->paginate(12);

        $categories = IceType::select('id', 'slug', 'title')->where('status', true)->orderBy('sort_id')->get();

        return view('catalog.ice-creams', compact('category', 'products', 'categories'));
    }

    public function cakesPage($category)
    {
        $products = Cake::where('status', true)->orderBy('sort_id')->paginate(12);
        $constructorPage = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
            ->where('type', 'constructor')
            ->where('status', Page::STATUS_ACTIVE)
            ->first();
        return view('catalog.cakes', compact('category', 'products', 'constructorPage'));
    }

    public function show($category, $productSlug)
    {
        if ($category === Icecream::ICECREAM) {
            return $this->icecreamShow($category, $productSlug);
        }
        if ($category === Icecream::CAKE) {
            return $this->cakeShow($category, $productSlug);
        }
        abort(404);
    }

    public function showInfo($category, $productSlug)
    {
        if ($category === Icecream::ICECREAM) {
            if (!Icecream::whereSlug($productSlug)->exists()) {
                abort(404);
            }

            $product = Icecream::with(['portions'])
                ->where('slug', $productSlug)
                ->where('status', true)
                ->orderBy('sort_id')
                ->first();

            $categories = IceType::with('icecreams')
                ->select('id', 'slug', 'title')
                ->where('status', true)
                ->orderBy('sort_id')
                ->get();

            $popularProducts = Icecream::where('status', true)->where('id', '!=', $product->id)->where('featured', true)->orderBy('sort_id')->limit(8)->get();

            return view('catalog.ice-cream-info', compact('product', 'categories', 'popularProducts'));
        }
        abort(404);
    }

    public function icecreamShow($category, $slug)
    {
        if (!Icecream::whereSlug($slug)->exists()) {
            abort(404);
        }

        $product = Icecream::with(['portions'])
            ->where('slug', $slug)
            ->where('status', true)
            ->orderBy('sort_id')
            ->first();

        $categories = IceType::with('icecreams')
            ->select('id', 'slug', 'title')
            ->where('status', true)
            ->orderBy('sort_id')
            ->get();

        $popularProducts = Icecream::where('status', true)->where('id', '!=', $product->id)->where('featured', true)->orderBy('sort_id')->limit(8)->get();

        return view('catalog.ice-cream', compact('product', 'categories', 'popularProducts'));
    }


    public function cakeShow($category, $slug)
    {
        if (!Cake::whereSlug($slug)->exists()) {
            abort(404);
        }

        $product = Cake::where('slug', $slug)
            ->where('status', true)
            ->orderBy('sort_id')
            ->first();

        $products = Cake::select('id', 'slug', 'title', 'image')
            ->where('id', '!=', $product->id)
            ->where('status', true)
            ->orderBy('sort_id')
            ->limit(8)
            ->get();

        return view('catalog.cake', compact('product', 'products'));
    }

    public function getConstructorAddons()
    {
        $branches = Branch::select('id', 'title', 'status', 'sort_id')->where('status', true)->orderBy('sort_id')->get();
        $branches->shift();
        $branches->map(function ($branch) {
            $branch->setAttribute('full_title', $branch->title . ' 10:00 — 22:00 ежедневно');
        });

        $districts = District::where('status', true)->orderBy('sort_id')->get();

        $tastes = Icecream::where('status',true)->orderBy('sort_id')->get();

        return response()->json(['branches' => $branches, 'districts' => $districts, 'tastes' => $tastes]);
    }

    /*
     * Backend functions for Order/Product
     *
     */
    public function orderUpdate(Request $request, $orderId)
    {
        $order = Order::find($orderId);
        $order->status = $request->get('status');
        $order->update();

        return redirect()->route('voyager.orders.index')->with([
            'message' => __('voyager::generic.successfully_updated') . " {$order->name}",
            'alert-type' => 'success',
        ]);
    }
}
