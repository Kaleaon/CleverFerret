.class Lcom/flyersoft/opds/N$5;
.super Ljava/lang/Object;
.source "N.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/opds/N;->openLibraryEditDialog(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$library:Lcom/flyersoft/opds/OpdsSite;

.field final synthetic val$siteImage:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Landroid/widget/ImageView;Lcom/flyersoft/opds/OpdsSite;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 366
    iput-object p1, p0, Lcom/flyersoft/opds/N$5;->val$siteImage:Landroid/widget/ImageView;

    iput-object p2, p0, Lcom/flyersoft/opds/N$5;->val$library:Lcom/flyersoft/opds/OpdsSite;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 11

    .line 369
    new-instance v0, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/opds/N$5$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/opds/N$5$1;-><init>(Lcom/flyersoft/opds/N$5;)V

    const/4 p1, 0x1

    .line 377
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object v3

    sget-object v5, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 p1, 0x42b40000    # 90.0f

    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v7

    const/high16 p1, 0x428c0000    # 70.0f

    invoke-static {p1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v8

    sget p1, Lcom/flyersoft/moonreaderp/R$string;->edit_catalog:I

    .line 378
    invoke-static {p1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v9

    iget-object p1, p0, Lcom/flyersoft/opds/N$5;->val$library:Lcom/flyersoft/opds/OpdsSite;

    iget-object v10, p1, Lcom/flyersoft/opds/OpdsSite;->image:Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v6, 0x1

    invoke-direct/range {v0 .. v10}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    return-void
.end method
