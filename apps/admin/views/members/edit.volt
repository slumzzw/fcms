<!doctype html>
<html>
    <head>
        <link rel="stylesheet" href="/css/admin/base.css">
         <link rel="stylesheet" href="/bootstrap/3.3.0/css/bootstrap.min.css">
         <link rel="stylesheet" href="/bootstrap/datetimepicker/bootstrap-datetimepicker.min.css">
         <link rel="stylesheet" href="/public/css/admin/font-awesome.css" >
    </head>
    <style>
        button {
            margin-right:50px;
            width:70px;
        }
        .cny {
            position:absolute;left: 0; top:8px; margin-left:20px; font-size:14px; color:gray;
        }
        
    </style>
    <body class="wrap">
        <ul class="nav nav-tabs" role="tablist" id="tabs">
            <li role="presentation" class=""><a href="{{ url( 'admin/coupons/index' ) }}">优惠券</a></li>
            <li role="presentation" class="active"><a href="#edit">{% if isRead is defined %} 查看优惠券 {% else %}编辑优惠券{% endif %}</a></li>
        </ul>
        <div class="tab-content">
            <div role="tabpannel" class="tab-pane active" id="edit" style="padding-top:20px;">
                {% if coupon is defined and coupon is not empty %}
                <form class="form-horizontal" id="">
                    <div class="form-group has-feedback text-right">
                        <label class="col-xs-2 control-label">优惠券标题</label>
                        <div class="col-xs-3">
                            <input class="form-control" type="text" id="title" name="title" placeholder="请输入优惠券的标题" value='{{ coupon[ 'title' ] | escape_attr }}'  />
                        </div>
                    </div>
                    <div class="form-group has-feedback text-right ">
                        <label class="col-xs-2 control-label">日期方式</label>
                        <div class="col-xs-3 text-left">
                            <label class="radio-inline">
                            <input type="radio" id="type" name="type" value='0' {% if coupon[ 'type' ] == 0 %} checked {%  endif %}/>
                            日期范围
                            </label>
                            <label class="radio-inline">
                            <input type="radio" id="type" name="type"  value='1' {% if coupon[ 'type' ] == 1 %} checked {%  endif %} />
                            有效天数
                            </label>
                        </div>
                    </div>
                     <div class="form-group  has-feedback text-right range" style="display:{{ coupon[ 'isRange' ] }}">
                        <label class="col-xs-2 control-label">起始日期</label>
                        <div class="col-xs-2">
                            <input class="form-control form_datetime"  name="datefrom" type="text" value="{{ coupon[ 'datefrom'] | escape_attr }}"  />
                        </div>
                    </div>
                     <div class="form-group  has-feedback text-right range" style="display: {{ coupon[ 'isRange' ] }}">
                        <label class="col-xs-2 control-label">终止日期</label>
                        <div class="col-xs-2">
                            <input class="form-control form_datetime" name="dateto" type="text" value="{{ coupon[ 'dateto'] | escape_attr }}"  />
                        </div>
                    </div>
                     <div class="form-group  has-feedback text-right interval  " style="display: {{ coupon[ 'isInterval' ] }}">
                        <label class="col-xs-2 control-label">有效天数</label>
                        <div class="col-xs-2">
                            <input class="form-control" name="dateinterval" type="text"  placeholder="请输入从今天算起，优惠券有效天数" value="{{ coupon[ 'dateinterval'] | escape_attr }}"  />
                        </div>
                    </div>
                    <div class="form-group  has-feedback text-right">
                        <label class="col-xs-2 control-label">消费最低金额</label>
                        <div class="col-xs-2">
                            <strong class="cny">￥</strong>
                            <input class="form-control"  style="padding-left:20px;" type="text" id="limit" name="limit" placeholder="请输入消费最低金额" value="{{ coupon[ 'lowlimit' ] | escape_attr }}"/>
                        </div>
                    </div>
                    <div class="form-group has-feedback text-right">
                        <label class="col-xs-2 control-label">优惠券金额</label>
                        <div class="col-xs-2">
                            <strong class="cny">￥</strong>
                            <input class="form-control" style="padding-left:20px;" type="text" id="value" name="value" placeholder="请输入优惠券金额" value='{{ coupon[ 'value' ] | escape_attr }}'  />
                        </div>
                    </div>
                    
                     <div class="form-group  has-feedback text-right">
                        <label class="col-xs-2 control-label">图片</label>
                        <div class="col-xs-3 text-left">
                            <img id="pic" src=" {{ coupon[ 'pic' ] | escape_attr }}" style=" width:100px; display: '{% if coupon[ 'pic' ] %} block {% else %} none {% endif %}'">
                            <input type='hidden' name="pic" value="{{ coupon[ 'pic' ] | escape_attr }}">
                            {% if !coupon[ 'pic' ] %}
                            <button type="button" class="btn btn-info btn-sm text-center" id="addPic"> <i class="glyphicon glyphicon-upload" style="margin-right: 5px;"></i>添加</button>
                            {% endif %}
                        </div>
                    </div>
                 
                    <div class="form-group" style="margin-top: 30px;">
                        <div class="col-xs-offset-2 col-xs-3 text-left">
                            {% if isRead is not defined %}
                            <button type="button" class="btn btn-success btn-sm" id="saveCoupon"  >保存</button>
                            {% endif %}
                            <button type="button" class="btn btn-default btn-sm" id="cancel" onclick="location='/admin/coupons/index';" >返回</button>
                        </div>
                    </div>
                     <div class="col-xs-12 text-center loading"  style="margin-top:-20px; display:none;"> 
                        <i class="fa fa-pulse fa-spinner  fa-2x"  > </i>
                    </div>
                    <input type="hidden" name="id"  value="{{ coupon['id'] | e }}" />
                </form>
                {% else %}
                <div class="col-xs-12 text-center text-danger">没有数据</div>
                {% endif %}
            </div>
            
        </div>
         <div class="alert alert-danger text-center col-xs-2" style="margin-left:40%;display:none;">
             <i class="glyphicon glyphicon-warning-sign pull-left"></i>
            <span>网络错误</span>
        </div>
        <div class="sr-only"> <script type="text/plain" id="picEdit" ></script></div>
       
        <script src="/js/jquery/jquery-1.11.1.min.js"></script>
        <script src="/bootstrap/datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="/bootstrap/datetimepicker/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
        <script src="/u/ueditor.config.js"></script>
        <script src="/u/ueditor.all.js"></script>
        <script charset="utf-8" src="/u/lang/zh-cn/zh-cn.js"></script>
        <script>
    $(function () {
        /*--------------检验数据----------------*/
        $( 'input:text' ).blur( function(){
           var parent = $( this ).parents( '.form-group' );
           var value = $( this ).val(); 
           if( $( this ).hasClass( 'form_datetime' )) //时间不校验
           {
               return false;
           }

           if( value && value !== '0' ) 
           {
               success( parent );
           }
           else
           {
               error( parent );
           }
        });

        /*--------------保存优惠券-------------------*/
        $( '#saveCoupon' ).click( function(){
            if( ! $( '#title' ).val() )
            {
                errorMsg( '请输入优惠券标题' );
                return false;
            }
            if( ! $( '#limit' ).val() )
            {
                errorMsg( '请输入优惠券最低消费金额' );
                return false;
            }
            if( ! $( '#value' ).val() )
            {
                errorMsg( '请输入优惠券金额' );
                return false;
            }
            
            var data =  $( 'form' ).serialize();
            var key = '&<?php echo $this->security->getTokenKey();?>=<?php echo $this->security->getToken();?>';
                data += key;
            $( '.loading' ).show();
           $.post( '/admin/coupons/update', data, function( ret ){
               if( ! ret.status )
               {
                   location = '/admin/coupons/index';
               }
               else
               {
                   errorMsg( ret.msg );
               }
               $( '.loading' ).hide();
           }, 'json') .error( function(){
               errorMsg( '网络不通' );
           });

        });

            /*--------------切换日期方式--------------*/
        $( 'input[name="type"]' ).change( function(){
            var type = $( 'input[name="type"]:checked').val(); 
            if( type === '1' )
            {
                $( '.range' ).hide();
                $( '.interval' ).show();
            }
            else
            {
                $( '.range' ).show();
                $( '.interval' ).hide();
            }

        });

        $('.form_datetime').datetimepicker({
            language: 'zh-CN',
            autoclose: 1,
            todayBtn: 1,
            pickerPosition: "bottom-left",
            minuteStep: 5,
            format: 'yyyy-mm-dd',
            minView: 'month'　　　　//日期时间选择器所能够提供的最精确的时间选择视图。
        }).on( 'changeDate', function( ev ){
            var d = ev.date.valueOf();
                var df = $( '#datefrom' ).val();
                var dt = $( '#dateto' ).val();
                if( df && dt )
                {
                    if( Date.parse( dt ) < Date.parse( df )  )
                    {
                        errorMsg( '终止日期必须大于起始日期' );
                    }
                }
        });

         var picEditor = UE.getEditor( 'picEdit', { sid: '<?php echo $this->session->getId(); ?>', isShow: false,
            toolbars: [ [ 'insertimage' ] ], bizt: 'user' } );
        picEditor.addListener( 'beforeInsertImage', function( t, arg ){     //侦听图片上传
            if( arg.length )
            {
                $( '#pic' ).attr( 'src', arg[0].src );
                $( '#pic' ).siblings( 'input' ).val( arg[0].src );
                $( '#pic' ).show();
            }
        } );
        $( '#addPic' ).click( function(){ //图片的添加
            var myImage = picEditor.getDialog( "insertimage" );
            myImage.open();
        } );
        $( 'form' ).delegate( '#pic', 'click', function(){ //图片修改
            var myImage = picEditor.getDialog( "insertimage" );
            myImage.open();
        } );        
    });

    function success( obj )
    {
        obj.find( 'span' ).remove();
        obj.addClass( 'has-success' ).removeClass( 'has-error' );
        obj.find( '.form-control' ).after( '<span class="glyphicon glyphicon-ok form-control-feedback"></span>' );
    }
    function error( obj )
    {
        obj.find( 'span' ).remove();
        obj.addClass( 'has-error' ).removeClass( 'has-success' );
        obj.find( '.form-control' ).after( '<span class="glyphicon glyphicon-remove form-control-feedback"></span>' );
    }
    function errorMsg( msg )
    {
        $( '.alert' ).removeClass( 'alert-success' ).addClass( 'alert-danger' );
        $( '.alert span' ).text( msg );
        $( '.alert' ).show().fadeOut( 3000 );
    }
        </script>
    </body>
</html>