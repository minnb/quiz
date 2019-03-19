<?php $slides = App\Models\Slider::getSlide(); ?>
@if($slides->count() > 0 )
<section class="bannercontainer bannercontainerV1">
  <div class="fullscreenbanner-container">
    <div class="fullscreenbanner">
      <ul>
        @foreach($slides as $key=>$item)
        <li data-transition="fade" data-slotamount="5" data-masterspeed="700" data-title="Slide 1">
          <img src="{{ asset($item->image) }}" alt="{{$item->name1}}" data-bgfit="cover" data-bgposition="center center" data-bgrepeat="no-repeat">
          <div class="slider-caption container">
            <div class="tp-caption rs-caption-1 sft start"
              data-hoffset="0"
              data-y="200"
              data-speed="800"
              data-start="1000"
              data-easing="Back.easeInOut"
              data-endspeed="300">
              {!! $item->name1 !!}
            </div>

            <div class="tp-caption rs-caption-2 sft"
              data-hoffset="0"
              data-y="265"
              data-speed="1000"
              data-start="1500"
              data-easing="Power4.easeOut"
              data-endspeed="300"
              data-endeasing="Power1.easeIn"
              data-captionhidden="off">
              {!! $item->name2 !!}
            </div>
          </div>
        </li>
        @endforeach
      </ul>
    </div>
  </div>
</section>
@endif
<section class="clearfix linkSection hidden-xs">
  <div class="sectionLinkArea hidden-xs scrolling">
    <div class="container">
      <div class="row">
        <div class="col-sm-3">
          <a href="#ourCourses" class="sectionLink bg-color-1" id="coursesLink">
            <i class="fa fa-file-text-o linkIcon border-color-1" aria-hidden="true"></i>
            <span class="linkText">Khoá học</span>
            <i class="fa fa-chevron-down locateArrow" aria-hidden="true"></i>
          </a>
        </div>
        <div class="col-sm-3 ">
          <a href="#ourTeam" class="sectionLink bg-color-2" id="teamLink">
            <i class="fa fa-calendar-o linkIcon border-color-2" aria-hidden="true"></i>
            <span class="linkText">Giáo viên</span>
            <i class="fa fa-chevron-down locateArrow" aria-hidden="true"></i>
          </a>
        </div>
        <div class="col-sm-3 ">
          <a href="#ourGallery" class="sectionLink bg-color-3" id="galleryLink">
            <i class="fa fa-picture-o linkIcon border-color-3" aria-hidden="true"></i>
            <span class="linkText">Hình ảnh</span>
            <i class="fa fa-chevron-down locateArrow" aria-hidden="true"></i>
          </a>
        </div>
        <div class="col-sm-3">
          <a href="#latestNews" class="sectionLink bg-color-4" id="newsLink">
            <i class="fa fa-files-o linkIcon border-color-4" aria-hidden="true"></i>
            <span class="linkText">Tin tức</span>
            <i class="fa fa-chevron-down locateArrow" aria-hidden="true"></i>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>
