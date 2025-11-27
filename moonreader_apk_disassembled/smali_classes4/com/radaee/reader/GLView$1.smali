.class Lcom/radaee/reader/GLView$1;
.super Ljava/lang/Object;
.source "GLView.java"

# interfaces
.implements Landroid/view/PixelCopy$OnPixelCopyFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/radaee/reader/GLView;->getBitmap(Lcom/radaee/reader/GLView$OnPixelCopy;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/radaee/reader/GLView;

.field final synthetic val$bm:Landroid/graphics/Bitmap;

.field final synthetic val$onCopy:Lcom/radaee/reader/GLView$OnPixelCopy;


# direct methods
.method constructor <init>(Lcom/radaee/reader/GLView;Lcom/radaee/reader/GLView$OnPixelCopy;Landroid/graphics/Bitmap;)V
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

    .line 118
    iput-object p1, p0, Lcom/radaee/reader/GLView$1;->this$0:Lcom/radaee/reader/GLView;

    iput-object p2, p0, Lcom/radaee/reader/GLView$1;->val$onCopy:Lcom/radaee/reader/GLView$OnPixelCopy;

    iput-object p3, p0, Lcom/radaee/reader/GLView$1;->val$bm:Landroid/graphics/Bitmap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPixelCopyFinished(I)V
    .locals 1

    if-nez p1, :cond_0

    .line 122
    iget-object p1, p0, Lcom/radaee/reader/GLView$1;->val$onCopy:Lcom/radaee/reader/GLView$OnPixelCopy;

    iget-object v0, p0, Lcom/radaee/reader/GLView$1;->val$bm:Landroid/graphics/Bitmap;

    invoke-interface {p1, v0}, Lcom/radaee/reader/GLView$OnPixelCopy;->onSuccessCallback(Landroid/graphics/Bitmap;)V

    return-void

    .line 124
    :cond_0
    iget-object p1, p0, Lcom/radaee/reader/GLView$1;->val$onCopy:Lcom/radaee/reader/GLView$OnPixelCopy;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Lcom/radaee/reader/GLView$OnPixelCopy;->onSuccessCallback(Landroid/graphics/Bitmap;)V

    return-void
.end method
