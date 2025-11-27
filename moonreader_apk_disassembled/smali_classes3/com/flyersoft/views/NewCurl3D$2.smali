.class Lcom/flyersoft/views/NewCurl3D$2;
.super Landroid/os/Handler;
.source "NewCurl3D.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/NewCurl3D;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/views/NewCurl3D;


# direct methods
.method constructor <init>(Lcom/flyersoft/views/NewCurl3D;Landroid/os/Looper;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 1938
    iput-object p1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 11

    .line 1941
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 1942
    iget-object v2, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v2}, Lcom/flyersoft/views/NewCurl3D;->getWidth()I

    move-result v2

    .line 1943
    iget-object v3, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v3}, Lcom/flyersoft/views/NewCurl3D;->getHeight()I

    move-result v3

    .line 1945
    iget v4, p1, Landroid/os/Message;->what:I

    rem-int/lit8 v4, v4, 0xa

    const/4 v5, 0x1

    const/4 v8, 0x0

    if-ne v4, v5, :cond_0

    goto :goto_0

    :cond_0
    const/4 v5, 0x0

    :goto_0
    const/4 v4, 0x3

    const/4 v6, 0x2

    if-eqz v5, :cond_1

    const/4 v7, 0x2

    goto :goto_1

    :cond_1
    const/4 v7, 0x3

    :goto_1
    const/4 v9, 0x4

    if-eqz v5, :cond_2

    const/4 v5, 0x3

    goto :goto_2

    :cond_2
    const/4 v5, 0x4

    .line 1948
    :goto_2
    iget p1, p1, Landroid/os/Message;->what:I

    const/16 v10, 0xd

    packed-switch p1, :pswitch_data_0

    const/16 v9, 0x17

    packed-switch p1, :pswitch_data_1

    const/4 p1, 0x0

    goto/16 :goto_3

    :pswitch_0
    mul-int v2, v2, v7

    mul-int/lit8 v2, v2, 0x3

    .line 1985
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    mul-int/lit8 v5, v5, 0x3

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x1

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1986
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    goto/16 :goto_3

    :pswitch_1
    mul-int v2, v2, v7

    mul-int/lit8 v2, v2, 0x2

    .line 1980
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    mul-int/lit8 v5, v5, 0x2

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x2

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1981
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1982
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    const/16 v3, 0x18

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_3

    :pswitch_2
    mul-int v2, v2, v7

    .line 1975
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x2

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1976
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1977
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, v9, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_3

    :pswitch_3
    const/4 p1, 0x0

    .line 1970
    div-int/lit8 p1, p1, 0x64

    int-to-float v5, p1

    mul-int/lit8 v3, v3, 0x63

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-wide v2, v0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1971
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1972
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v1, :cond_3

    const/16 v9, 0x16

    :cond_3
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, v9, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto/16 :goto_3

    :pswitch_4
    mul-int/lit8 v7, v7, 0x4

    rsub-int/lit8 p1, v7, 0x64

    mul-int v2, v2, p1

    .line 1965
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    mul-int/lit8 v5, v5, 0x2

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x1

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1966
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    goto/16 :goto_3

    :pswitch_5
    mul-int/lit8 v7, v7, 0x3

    rsub-int/lit8 p1, v7, 0x64

    mul-int v2, v2, p1

    .line 1960
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    mul-int/lit8 v5, v5, 0x2

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x2

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1961
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1962
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    const/16 v3, 0xe

    invoke-virtual {v0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_3

    :pswitch_6
    rsub-int/lit8 p1, v7, 0x64

    mul-int v2, v2, p1

    .line 1955
    div-int/lit8 v2, v2, 0x64

    int-to-float p1, v2

    mul-int/lit8 v5, v5, 0x2

    rsub-int/lit8 v2, v5, 0x64

    mul-int v3, v3, v2

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x2

    move-wide v2, v0

    move v5, p1

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1956
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1957
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, v10, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_3

    :pswitch_7
    mul-int/lit8 v2, v2, 0x64

    .line 1950
    div-int/lit8 v2, v2, 0x64

    int-to-float v5, v2

    mul-int/lit8 v3, v3, 0x63

    div-int/lit8 v3, v3, 0x64

    int-to-float v6, v3

    const/4 v7, 0x0

    const/4 v4, 0x0

    move-wide v2, v0

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p1

    .line 1951
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-virtual {v0, p1, v8}, Lcom/flyersoft/views/NewCurl3D;->simulateOnTouch(Landroid/view/MotionEvent;Z)V

    .line 1952
    iget-object v0, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    invoke-static {v0}, Lcom/flyersoft/views/NewCurl3D;->-$$Nest$fgetclickHandler(Lcom/flyersoft/views/NewCurl3D;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->mTurnType:I

    if-nez v1, :cond_4

    const/16 v10, 0xc

    :cond_4
    iget-object v1, p0, Lcom/flyersoft/views/NewCurl3D$2;->this$0:Lcom/flyersoft/views/NewCurl3D;

    iget v1, v1, Lcom/flyersoft/views/NewCurl3D;->stepDelay:I

    int-to-long v1, v1

    invoke-virtual {v0, v10, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    :goto_3
    if-eqz p1, :cond_5

    .line 1990
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 1992
    invoke-static {p1}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    :cond_5
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0xb
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x15
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
