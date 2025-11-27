.class Lcom/flyersoft/moonreaderp/ActivityTxt$183;
.super Ljava/lang/Object;
.source "ActivityTxt.java"

# interfaces
.implements Lcom/radaee/reader/GLView$OnPixelCopy;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityTxt;->getPageShot(ZLcom/flyersoft/tools/T$OnResult;)Landroid/graphics/Bitmap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

.field final synthetic val$onresult:Lcom/flyersoft/tools/T$OnResult;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityTxt;Lcom/flyersoft/tools/T$OnResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 18204
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$183;->this$0:Lcom/flyersoft/moonreaderp/ActivityTxt;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$183;->val$onresult:Lcom/flyersoft/tools/T$OnResult;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccessCallback(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 18207
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityTxt$183;->val$onresult:Lcom/flyersoft/tools/T$OnResult;

    invoke-interface {v0, p1}, Lcom/flyersoft/tools/T$OnResult;->done(Ljava/lang/Object;)V

    return-void
.end method
