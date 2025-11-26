.class Lcom/flyersoft/moonreaderp/PicGalleryShow$16;
.super Ljava/lang/Object;
.source "PicGalleryShow.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PicGalleryShow;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

.field final synthetic val$intervalEdit:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PicGalleryShow;Landroid/widget/EditText;)V
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

    .line 1228
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->val$intervalEdit:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1230
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->val$intervalEdit:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_0

    .line 1231
    sget p2, Lcom/flyersoft/tools/A;->gallerySlideshowInterval:I

    if-eq p1, p2, :cond_0

    .line 1232
    sput p1, Lcom/flyersoft/tools/A;->gallerySlideshowInterval:I

    .line 1233
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    if-eqz p1, :cond_0

    .line 1234
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    invoke-virtual {p1}, Ljava/util/Timer;->cancel()V

    .line 1235
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    const/4 p2, 0x0

    iput-object p2, p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->slideshowTimer:Ljava/util/Timer;

    .line 1236
    sget-object p1, Lcom/flyersoft/moonreaderp/PicGalleryShow;->selfPref:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PicGalleryShow$16;->this$0:Lcom/flyersoft/moonreaderp/PicGalleryShow;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PicGalleryShow;->playIv:Landroid/view/View;

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PicGalleryShow;->onClick(Landroid/view/View;)V

    :cond_0
    return-void
.end method
