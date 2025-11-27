.class Lcom/flyersoft/moonreaderp/ActivityTxt$58;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->showPageAnimation(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$flip_type2:I

.field final synthetic val$isPageDown:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZI)V
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

    .line 5711
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->val$isPageDown:Z

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->val$flip_type2:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 5714
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$58;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$58$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$58;)V

    const/4 v2, 0x1

    invoke-virtual {v0, v2, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(ZLcom/flyersoft/tools/T$OnResult;)Landroid/graphics/Bitmap;

    return-void
.end method
