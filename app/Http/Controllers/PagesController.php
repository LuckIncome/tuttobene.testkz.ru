<?php

namespace App\Http\Controllers;

use App\Models\Advantage;
use App\Models\Branch;
use App\Models\Certificate;
use App\Models\Contact;
use App\Models\Icecream;
use App\Models\Member;
use App\Models\Page;
use App\Models\Post;
use App\Models\Product;
use App\Models\Project;
use App\Models\Review;
use App\Models\Service;
use App\Models\Slider;
use App\Models\Partner;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\ImageText;

class PagesController extends Controller
{
    public function getPage($slug = 'home')
    {
        $page = Page::where('slug', $slug)->where('status', Page::STATUS_ACTIVE)->orWhere('type', $slug)->firstOrFail();
        switch ($page->type) {
            case ("home"):
            case ("about"):
            case ("cooperation"):
            case ("team"):
            case ("partners"):
            case ("certs"):
            case ("franchise"):
            case ("contacts"):
            case ("horeca"):
            case ("material"):
            case ("gelato"):
            case ("constructor"):
            case ("services"):
                return $this->{$page->type . 'Page'}($page);
                break;
            case ("catalog"):
            case ("cart"):
            case ("posts"):
                abort(404);
                break;
            default:
                return view('pages.' . $page->type, compact('page'));
                break;
        }
    }

    public function homePage(Page $page)
    {
        $branches = Branch::where('status', true)->orderBy('sort_id')->get();
        $branches->shift();
        $numbers = $page->imageTexts()->whereNull('image')->whereNull('icon')->orderBy('sort_id')->get();
        $aboutBlock = $page->imageTexts()->whereNotNull('image')->whereNull('title')->first();
        $compoundBlocks = $page->imageTexts()->whereNull('image')->whereNotNull('icon')->get()->groupBy('sort_id');
        $mainBlock = $page->imageTexts()->whereNotNull('image')->whereNotNull('title')->first();
        $servicePage = Page::select('id', 'slug', 'title')->where('type', 'services')->where('status', Page::STATUS_ACTIVE)->first();
        $posts = Post::select('id', 'title', 'image', 'slug', 'created_at')->where('status', Post::PUBLISHED)->orderByDesc('featured')->orderByDesc('created_at')->limit(4)->get();
        $sliders = Slider::select('id', 'title', 'image', 'status', 'sort_id')->where('status', true)->orderBy('sort_id')->get();
        $newProducts = Icecream::with(['defaultPortion', 'iceType'])->where('status', true)->where('featured', true)->orderBy('sort_id')->limit(8)->get();
        return view('pages.home', compact('page', 'branches', 'numbers', 'aboutBlock', 'mainBlock', 'compoundBlocks', 'servicePage', 'posts', 'sliders', 'newProducts'));
    }

    public function aboutPage(Page $page)
    {
        $pages = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
            ->whereIn('type', ['team', 'partners', 'certs', 'contacts'])
            ->where('status', Page::STATUS_ACTIVE)
            ->get();

        $mainBlocks = $page->imageTexts->whereNotNull('image')->whereNotNull('body');
        $tabBlocks = $page->imageTexts->whereNotNull('icon')->whereNotNull('body');
        return view('pages.about', compact('page', 'pages', 'mainBlocks', 'tabBlocks'));
    }

    public function cooperationPage(Page $page)
    {
        $pages = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
            ->whereIn('type', ['franchise', 'horeca', 'material'])
            ->where('status', Page::STATUS_ACTIVE)
            ->get();
        return view('pages.' . $page->type, compact('page', 'pages'));
    }

    public function contactsPage(Page $page)
    {
        $contacts = Contact::where('status', true)->orderBy('sort_id')->get();
        $branches = Branch::where('status', true)->orderBy('sort_id')->get();
        $mainBranch = $branches->shift();
        return view('pages.contacts', compact('page', 'contacts', 'branches', 'mainBranch'));
    }

    public function teamPage(Page $page)
    {
        $parentPage = Page::where('type', 'about')->where('status', Page::STATUS_ACTIVE)->first();
        $team = Member::where('status', true)->orderBy('sort_id')->get()->groupBy('spec');
        return view('pages.team', compact('page', 'team', 'parentPage'));
    }

    public function partnersPage(Page $page)
    {
        $parentPage = Page::where('type', 'about')->where('status', Page::STATUS_ACTIVE)->first();
        $partners = Partner::where('status', true)->orderBy('sort_id')->get();
        return view('pages.partners', compact('page', 'partners', 'parentPage'));
    }

    public function certsPage(Page $page)
    {
        $parentPage = Page::where('type', 'about')->where('status', Page::STATUS_ACTIVE)->first();
        $certs = Certificate::where('status', true)->orderBy('sort_id')->paginate(12);
        return view('pages.certs', compact('page', 'certs', 'parentPage'));
    }

    public function franchisePage(Page $page)
    {
        $parentPage = Page::where('type', 'cooperation')->where('status', Page::STATUS_ACTIVE)->first();

        $mainBlock = $page->imageTexts->whereNotNull('image')->first();
        //$textBlocks = $page->imageTexts->whereNull('icon')->whereNull('image')->groupBy('title');
        $textBlocks = ImageText::whereBetween('id', [49, 50])->get();

        return view('pages.' . $page->type, compact('page', 'parentPage', 'mainBlock', 'textBlocks'));
    }

    public function horecaPage(Page $page)
    {
        $parentPage = Page::where('type', 'cooperation')->where('status', Page::STATUS_ACTIVE)->first();
        $mainBlock = $page->imageTexts->whereNotNull('image')->whereNull('icon')->first();
        $iconBlocks = $page->imageTexts->whereNotNull('icon')->whereNull('image')->sortBy('sort_id');

        $products = Icecream::with(['defaultPortion', 'iceType'])
            ->where('status', true)
            ->orderBy('sort_id')
            ->get()
            ->groupBy('iceType.slug');

        $popularProducts = Icecream::with(['defaultPortion', 'iceType'])
            ->where('status', true)
            ->where('featured', true)
            ->orderBy('sort_id')
            ->get();

        return view('pages.' . $page->type, compact('page', 'parentPage', 'mainBlock', 'iconBlocks', 'products', 'popularProducts'));
    }

    public function materialPage(Page $page)
    {
        $parentPage = Page::where('type', 'cooperation')->where('status', Page::STATUS_ACTIVE)->first();
        $mainBlock = $page->imageTexts->whereNotNull('icon')->whereNotNull('image')->first();
        $textBlocks = $page->imageTexts->whereNull('icon')->whereNull('image');
        $iconBlocks = $page->imageTexts->whereNotNull('icon')->whereNull('image');
        return view('pages.' . $page->type, compact('page', 'parentPage', 'mainBlock', 'textBlocks', 'iconBlocks'));
    }

    public function gelatoPage($page)
    {
        $blocks = $page->imageTexts->groupBy('sort_id');
        $products = Icecream::with(['defaultPortion', 'iceType'])
            ->where('status', true)
            ->orderBy('sort_id')
            ->get()
            ->groupBy('iceType.slug');

        $popularProducts = Icecream::with(['defaultPortion', 'iceType'])
            ->where('status', true)
            ->where('featured', true)
            ->orderBy('sort_id')
            ->get();

        return view('pages.' . $page->type, compact('page', 'blocks', 'products', 'popularProducts'));
    }

    public function constructorPage($page)
    {
        return view('catalog.' . $page->type, compact('page'));
    }

    public function servicesPage($page)
    {
        $services = Service::where('status', true)->orderBy('sort_id')->get();
        return view('pages.' . $page->type, compact('page', 'services'));
    }

    public function pageInner($mainPageSlug, $innerPageSlug)
    {

    }

}
