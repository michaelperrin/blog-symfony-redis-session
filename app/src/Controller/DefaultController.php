<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Session\SessionInterface;

class DefaultController
{
    public function store(SessionInterface $session)
    {
        // stores an attribute in the session for later reuse
        $session->set('foo', 'bar');

        return new Response(
            '<html><body>Value succesfully stored in the session</body></html>'
        );
    }

    public function get(SessionInterface $session)
    {
        // gets an attribute by name
        $foo = $session->get('foo');

        return new Response(
            sprintf('<html><body>Value: %s</body></html>', $foo)
        );
    }
}
