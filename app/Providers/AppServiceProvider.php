<?php

namespace App\Providers;

use App\Models\Contact;
use App\Models\Page;
use Carbon\Carbon;
use Darryldecode\Cart\CartServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;
use TCG\Voyager\Http\Controllers\ContentTypes\Image;
use TCG\Voyager\Http\Controllers\ContentTypes\MultipleImage;
use TCG\Voyager\Http\Controllers\Controller;
use TCG\Voyager\Http\Controllers\VoyagerBaseController;
use TCG\Voyager\Http\Controllers\VoyagerController;
use TCG\Voyager\Http\Controllers\VoyagerSettingsController;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->register(CartServiceProvider::class);
        $this->app->bind(VoyagerBaseController::class, \App\Http\Controllers\Voyager\VoyagerBaseController::class);
        $this->app->bind(VoyagerController::class, \App\Http\Controllers\Voyager\VoyagerController::class);
        $this->app->bind(Controller::class, \App\Http\Controllers\Voyager\Controller::class);
        $this->app->bind(VoyagerSettingsController::class, \App\Http\Controllers\Voyager\VoyagerSettingsController::class);
        $this->app->bind(Image::class, \App\Http\Controllers\Voyager\ContentTypes\Image::class);
        $this->app->bind(MultipleImage::class, \App\Http\Controllers\Voyager\ContentTypes\MultipleImage::class);
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Carbon::setLocale('ru');
        Schema::defaultStringLength(191);
        view()->composer(['partials.header'], function ($view) {
            $view->with('cartCount', \Cart::getTotalQuantity());
            $view->with('phone', Contact::where('type', 'phone')->where('is_main', true)->where('status', true)->orderBy('sort_id')->first()->link);
        });
        view()->composer(['partials.footer'], function ($view) {
            $view->with('socials', Contact::where('status', true)->where('type', 'social')->orderBy('sort_id')->get());
            $view->with('phones', Contact::where('status', true)->where('type', 'phone')->orderBy('sort_id')->get());
            $view->with('emails', Contact::where('status', true)->where('type', 'email')->orderBy('sort_id')->get());
            $view->with('address', Contact::where('status', true)->where('type', 'address')->orderBy('sort_id')->first()->value);
            $aboutPages = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
                ->whereIn('type', ['team', 'partners', 'certs', 'contacts'])
                ->where('status', Page::STATUS_ACTIVE)
                ->get();
            $cooperatePages = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
                ->whereIn('type', ['franchise', 'horeca', 'material'])
                ->where('status', Page::STATUS_ACTIVE)
                ->get();
            $view->with('aboutPages', $aboutPages);
            $view->with('cooperatePages', $cooperatePages);

            $servicePage = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
                ->where('type', 'services')
                ->where('status', Page::STATUS_ACTIVE)
                ->first();
            $view->with('servicePage', $servicePage);

            $constructorPage = Page::select('id', 'type', 'slug', 'title', 'excerpt', 'image', 'status')
                ->where('type', 'constructor')
                ->where('status', Page::STATUS_ACTIVE)
                ->first();
            $view->with('constructorPage', $constructorPage);

        });
    }
}
