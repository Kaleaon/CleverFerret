.class Lcom/flyersoft/moonreaderp/ActivityTxt$115;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->autoScrollTurnPage_Step2(IZLcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$direction:I

.field final synthetic val$onGlResult:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ILcom/flyersoft/tools/T$OnResult;)V
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

    .line 12238
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->val$direction:I

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 12241
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->val$direction:I

    invoke-static {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mpageScroll(Lcom/flyersoft/moonreaderp/ActivityTxt;I)V

    .line 12242
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->baseFrame:Landroid/widget/FrameLayout;

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityTxt$115;)V

    const-wide/16 v2, 0x1e

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/FrameLayout;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
