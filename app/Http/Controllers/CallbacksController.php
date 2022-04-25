<?php

namespace App\Http\Controllers;

use App\Jobs\SendEmailJob;
use App\Mail\SendEmail;
use App\Models\Category;
use App\Models\Page;
use App\Models\Portfolio;
use App\Models\Post;
use App\Models\Product;
use App\Models\Project;
use App\Models\Service;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Support\Facades\Mail;


class CallbacksController extends Controller
{

    public function callback(Request $request)
    {
        $validator = \Validator::make(request()->all(), [
            'name' => 'required',
            'phone' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//         $users = User::where('role_id', 1)->select('email')->get()->pluck('email')->toArray();
        $users = ['tokkerbaz@gmail.com'];
        $data = [
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email ?? null,
            'comments' => $request->comments ?? null,
            'type' => $request->type ?? null,
        ];
//        \Mail::send(new SendEmail('emails.callback',$users,'Новая заявка на Обратный звонок',$data));

        return response()->json(['success' => true]);
    }
}
