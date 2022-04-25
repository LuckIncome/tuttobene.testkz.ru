<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\Post;
use Illuminate\Http\Request;

class PostsController extends Controller
{
    public function index()
    {
        $page = Page::where('type', 'posts')->where('status', Page::STATUS_ACTIVE)->firstOrFail();
        $posts = Post::where('status',Post::PUBLISHED)->orderByDesc('created_at')->paginate(12);
        return view('posts.index',compact('page','posts'));
    }

    public function show(Post $post)
    {
        if ($post->status !== Post::PUBLISHED) {
            abort(404);
        }
        $page = Page::where('type', 'posts')->where('status', Page::STATUS_ACTIVE)->firstOrFail();
        $posts = Post::select('id','title','image','slug','created_at')
            ->where('id','!=',$post->id)
            ->where('status',Post::PUBLISHED)
            ->orderByDesc('created_at')
            ->limit(4)
            ->get();
        return view('posts.show',compact('page','posts', 'post'));
    }
}
