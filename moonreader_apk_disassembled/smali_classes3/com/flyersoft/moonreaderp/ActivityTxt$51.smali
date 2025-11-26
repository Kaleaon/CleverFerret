.class Lcom/flyersoft/moonreaderp/ActivityTxt$51;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->doCurlFlip(ILandroid/view/MotionEvent;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$event:Landroid/view/MotionEvent;

.field final synthetic val$what:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ILandroid/view/MotionEvent;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 4700
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->val$what:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->val$event:Landroid/view/MotionEvent;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    .line 4703
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->pdf:Lcom/flyersoft/books/PDFReader;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Lcom/flyersoft/books/PDFReader;->setVisibility(I)V

    .line 4704
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$51;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    new-instance v0, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$51$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$51;)V

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
