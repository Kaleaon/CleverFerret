.class Lcom/flyersoft/moonreaderp/ActivityTxt$50;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->saveFlipShot(ZLcom/flyersoft/tools/T$OnResult;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$forceVisible:Z

.field final synthetic val$onResult:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLcom/flyersoft/tools/T$OnResult;)V
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

    .line 4657
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->val$forceVisible:Z

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->val$onResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 3

    .line 4660
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->val$forceVisible:Z

    check-cast p1, Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$50;->val$onResult:Lcom/flyersoft/tools/T$OnResult;

    invoke-static {v0, v1, p1, v2}, Lcom/flyersoft/moonreaderp/ActivityTxt;->-$$Nest$msaveFlipShot_step2(Lcom/flyersoft/moonreaderp/ActivityTxt;ZLandroid/graphics/Bitmap;Lcom/flyersoft/tools/T$OnResult;)V

    return-void
.end method
