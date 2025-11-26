.class Lcom/flyersoft/moonreaderp/ActivityMain$25;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->do_add_desktop(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bookName:Ljava/lang/String;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$selfPref:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2726
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$selfPref:Landroid/app/Activity;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$filename:Ljava/lang/String;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$bookName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 2728
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 2731
    invoke-static {p2}, Lcom/flyersoft/tools/A;->getCoverImages(Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0, p1, p2, p2}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-nez p1, :cond_1

    .line 2733
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$selfPref:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget p2, Lcom/flyersoft/moonreaderp/R$drawable;->w_book_bottom:I

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 2734
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$selfPref:Landroid/app/Activity;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$filename:Ljava/lang/String;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$bookName:Ljava/lang/String;

    invoke-static {p2, v0, v1, p1}, Lcom/flyersoft/tools/A;->addDesktopShortcut(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Landroid/graphics/drawable/Drawable;)V

    .line 2735
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1a

    if-ge p1, p2, :cond_2

    .line 2736
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$selfPref:Landroid/app/Activity;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$selfPref:Landroid/app/Activity;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->add_to_desktop:I

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": "

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$25;->val$bookName:Ljava/lang/String;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_2
    :goto_0
    return-void
.end method
