.class Lcom/flyersoft/moonreaderp/ActivityTxt$114;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->autoScrollTurnPage(IZLcom/flyersoft/tools/T$OnResult;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$direction:I

.field final synthetic val$hideTips:Z

.field final synthetic val$onGlResult:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;IZLcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 12202
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$direction:I

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$hideTips:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 3

    .line 12205
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/ScrollImage;->setPage2Bm(Landroid/graphics/Bitmap;)V

    .line 12206
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$direction:I

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$hideTips:Z

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$114;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-static {p1, v0, v1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$mautoScrollTurnPage_Step2(Lcom/flyersoft/moonreaderp/ActivityTxt;IZLcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method
