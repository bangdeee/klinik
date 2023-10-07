<?php
  include 'header.php';
?>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo mr-auto"><a href="index.html">Klinik Praktek Mandiri Bidan Ani Dwi Astuti<span>.</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt=""></a>-->

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.php">Home</a></li>
          <li><a href="#about">Facility</a></li>
          
          <li><a href="#services">Services</a>
          </li>
          <li><a href="#testimonials">Testimonials</a></li>
          <li><a href="#portofolio">Artikel</a></li>
          <li><a href="#contact">Contact</a></li>
          <li>
          <?php
          if (isset($_SESSION["usernameUser"])) {
            echo "<a href='includes/logout.inc.php' class='login'>Logout</a>";
          } else {
            echo "<a href='login.php' class='login'>Login</a>";
          }
        ?> <li>
        </ul>
      </nav><!-- .nav-menu -->

    </div>
  </header><!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>Welcome to <span>Klinik Praktek Mandiri Bidan Ani Dwi Astuti</spa>
      </h1>
      <h2>Memberikan pelayanan terbaik, aman, bermutu tinggi dan inovatif</h2>
      <div class="d-flex">
        <a href="" class="btn-get-started scrollto">Get Started</a>
        </div>
    </div>
  </section><!-- End Hero -->