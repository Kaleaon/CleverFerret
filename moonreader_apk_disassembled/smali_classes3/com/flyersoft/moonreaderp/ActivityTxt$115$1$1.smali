.class Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/flyersoft/tools/T$OnResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12245
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(Ljava/lang/Object;)V
    .locals 1

    .line 12248
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {v0, p1}, Lcom/flyersoft/views/ScrollImage;->setPage1Bm(Landroid/graphics/Bitmap;)V

    .line 12249
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;->scrollImage:Lcom/flyersoft/views/ScrollImage;

    invoke-virtual {p1}, Lcom/flyersoft/views/ScrollImage;->invalidate()V

    .line 12250
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    if-eqz p1, :cond_0

    .line 12251
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityTxt$115;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityTxt$115;->val$onGlResult:Lcom/flyersoft/tools/T$OnResult;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
