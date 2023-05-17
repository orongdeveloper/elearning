<?php

/* layout-public.html */
class __TwigTemplate_e90fa57625215670b6cadf6ca7ed17e0cf12b9d2d310477f3e4d8bec9581a7cb extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
            'title' => array($this, 'block_title'),
            'css' => array($this, 'block_css'),
            'content' => array($this, 'block_content'),
            'js' => array($this, 'block_js'),
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html lang=\"en\">

<head>
    <title>";
        // line 5
        $this->displayBlock('title', $context, $blocks);
        echo "</title>";
        // line 6
        $this->env->loadTemplate("layout-header.html")->display($context);
        $this->displayBlock('css', $context, $blocks);
        // line 7
        echo "</head>

<body>

    <div class=\"navbar navbar-fixed-top\">
        <div class=\"navbar-inner\">
            <div class=\"container\">
                <a class=\"btn btn-navbar\" data-toggle=\"collapse\" data-target=\".navbar-inverse-collapse\">
                    <i class=\"icon-reorder shaded\"></i>
                </a>

                <a class=\"brand\" href=\"";
        // line 18
        echo twig_escape_filter($this->env, site_url(), "html", null, true);
        echo "\">
                    <img src=\"";
        // line 19
        echo twig_escape_filter($this->env, get_logo_config(), "html", null, true);
        echo "\"> <span class=\"visible-phone brand-txt\">e-Learning</span><span
                        class=\"visible-desktop visible-tablet brand-txt\">";
        // line 20
        echo twig_escape_filter($this->env, (isset($context["site_name"]) ? $context["site_name"] : null), "html", null, true);
        echo "</span>
                </a>

                <div class=\"nav-collapse collapse navbar-inverse-collapse\">
                    <ul class=\"nav pull-right\">";
        // line 25
        if (((get_pengaturan("registrasi-siswa", "value") == 1) || (get_pengaturan("registrasi-pengajar", "value") == 1))) {
            // line 26
            echo "                        <li><a href=\"";
            echo twig_escape_filter($this->env, site_url("login/register"), "html", null, true);
            echo "\">Register</a></li>";
        }
        // line 28
        echo "                    </ul>
                </div>
            </div>
        </div>
        <!-- /navbar-inner -->
    </div>
    <!-- /navbar -->

    <div class=\"wrapper\">
        <div class=\"container\">";
        // line 39
        $this->displayBlock('content', $context, $blocks);
        // line 40
        echo "
        </div>
    </div>
    <!--/.wrapper-->

    <div class=\"footer\">
        <div class=\"container\">
            <center>
                <b class=\"copyright\">By Engelbertus Hendro </b> All rights reserved.<br>";
        // line 48
        echo (isset($context["version"]) ? $context["version"] : null);
        echo " | Page loaded
                in";
        // line 49
        echo twig_escape_filter($this->env, (isset($context["elapsed_time"]) ? $context["elapsed_time"] : null), "html", null, true);
        echo " seconds.
            </center>
        </div>
    </div>";
        // line 54
        $this->env->loadTemplate("layout-footer.html")->display($context);
        $this->displayBlock('js', $context, $blocks);
        // line 55
        echo "</body>
";
    }

    // line 5
    public function block_title($context, array $blocks = array())
    {
        echo twig_escape_filter($this->env, (isset($context["site_name"]) ? $context["site_name"] : null), "html", null, true);
    }

    // line 6
    public function block_css($context, array $blocks = array())
    {
    }

    // line 39
    public function block_content($context, array $blocks = array())
    {
    }

    // line 54
    public function block_js($context, array $blocks = array())
    {
    }

    public function getTemplateName()
    {
        return "layout-public.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  127 => 54,  122 => 39,  117 => 6,  111 => 5,  106 => 55,  103 => 54,  97 => 49,  93 => 48,  83 => 40,  81 => 39,  70 => 28,  65 => 26,  63 => 25,  56 => 20,  52 => 19,  48 => 18,  35 => 7,  32 => 6,  29 => 5,  23 => 1,);
    }
}
