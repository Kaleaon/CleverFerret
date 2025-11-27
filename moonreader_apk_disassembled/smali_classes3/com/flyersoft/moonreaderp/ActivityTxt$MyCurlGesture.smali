.class Lcom/flyersoft/moonreaderp/ActivityTxt$MyCurlGesture;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ActivityTxt.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "MyCurlGesture"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 9696
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MyCurlGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onFling(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    .line 9698
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$MyCurlGesture;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-static {p1, p3}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$fputmCurlFlingDirection(Lcom/flyersoft/moonreaderp/ActivityTxt;F)V

    const/4 p1, 0x0

    return p1
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
