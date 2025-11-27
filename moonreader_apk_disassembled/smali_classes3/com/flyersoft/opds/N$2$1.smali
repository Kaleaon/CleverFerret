.class Lcom/flyersoft/opds/N$2$1;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/opds/N$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/opds/N$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 287
    iput-object p1, p0, Lcom/flyersoft/opds/N$2$1;->this$0:Lcom/flyersoft/opds/N$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 289
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 291
    iget-object p2, p0, Lcom/flyersoft/opds/N$2$1;->this$0:Lcom/flyersoft/opds/N$2;

    iget-object p2, p2, Lcom/flyersoft/opds/N$2;->val$siteImage:Landroid/widget/ImageView;

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setTag(Ljava/lang/Object;)V

    .line 292
    iget-object p2, p0, Lcom/flyersoft/opds/N$2$1;->this$0:Lcom/flyersoft/opds/N$2;

    iget-object p2, p2, Lcom/flyersoft/opds/N$2;->val$siteImage:Landroid/widget/ImageView;

    invoke-static {p1}, Lcom/flyersoft/opds/N;->getLibraryImage(Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_0
    return-void
.end method
