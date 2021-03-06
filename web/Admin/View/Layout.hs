
module Admin.View.Layout (defaultLayout, Html) where

import Admin.Routes
import Admin.Types
import Generated.Types
import IHP.Controller.RequestContext
import IHP.Environment
import IHP.ViewPrelude
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A

defaultLayout :: Html -> Html
defaultLayout inner =
  H.docTypeHtml ! A.lang "en" $
    [hsx|
<head>
    {metaTags}

    {stylesheets}
    {scripts}

    <title>Attics Admin</title>
</head>
<body>
    <div class="container mt-4">
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin/Bands">Bands</a></li>
                <li class="breadcrumb-item"><a href="/jobs/ListJobs">Jobs</a></li>
            </ol>
        </nav>

        {renderFlashMessages}
        {inner}
    </div>
</body>
|]

stylesheets :: Html
stylesheets = do
    [hsx|
        <link rel="stylesheet" href="/vendor/bootstrap.min.css"/>
        <link rel="stylesheet" href="/vendor/flatpickr.min.css"/>
        <link rel="stylesheet" href="/app-v1.css"/>
    |]

scripts :: Html
scripts = do
    [hsx|
        <script id="livereload-script" src="/livereload.js"></script>
        <script src="/vendor/jquery-3.2.1.slim.min.js"></script>
        <script src="/vendor/timeago.js"></script>
        <script src="/vendor/popper.min.js"></script>
        <script src="/vendor/bootstrap.min.js"></script>
        <script src="/vendor/flatpickr.js"></script>
        <script src="/helpers.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/ihp-auto-refresh.js"></script>
        <script src="/vendor/turbolinks.js"></script>
        <script src="/vendor/morphdom-umd.min.js"></script>
        <script src="/vendor/turbolinksMorphdom.js"></script>
        <script src="/vendor/turbolinksInstantClick.js"></script>
        <script src="/app-v1.js"></script>
    |]

metaTags :: Html
metaTags =
  [hsx|
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta property="og:title" content="Attics Admin"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="https://attics.io/admin/"/>
    <meta property="og:description" content="Attics Admin"/>
    {autoRefreshMeta}
|]
