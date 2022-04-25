<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class SendEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $view;
    public $users;
    public $subject;
    public $data;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($view, $users, $subject, $data)
    {
        $this->view = $view;
        $this->users = $users;
        $this->subject = $subject;
        $this->data = $data;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from(env('MAIL_FROM_ADDRESS','noreply@tuttobene.kz'),env('MAIL_FROM_NAME','Tutto-Bene'))->to($this->users)->subject($this->subject)
            ->view($this->view)->with($this->data);
    }
}
