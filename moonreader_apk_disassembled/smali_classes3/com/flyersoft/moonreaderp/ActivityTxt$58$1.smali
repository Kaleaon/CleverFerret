.class Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$58;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$58;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 5714
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 2

    .line 5717
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    check-cast p1, Landroid/graphics/Bitmap;

    iput-object p1, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->tmpFlipShot2:Landroid/graphics/Bitmap;

    .line 5718
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->val$isPageDown:Z

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$58;

    iget v1, v1, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->val$flip_type2:I

    invoke-static {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mshowPageAnimation_step2(Lcom/flyersoft/moonreaderp/ActivityTxt;ZI)V

    return-void
.end method
