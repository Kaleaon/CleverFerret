.class Lcom/flyersoft/moonreaderp/ActivityMain$43;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->setDefaultCover()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 4231
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$43;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetImageFile(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 4233
    sput-object p2, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/4 p2, 0x0

    .line 4234
    invoke-static {p2}, Lcom/flyersoft/tools/A;->getCoverImages(Z)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0, p1, p2, p2}, Lcom/flyersoft/tools/A;->getImagesDrawable(Ljava/util/ArrayList;Ljava/lang/String;II)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_0

    .line 4237
    sput-object p1, Lcom/flyersoft/tools/A;->defaultCover:Ljava/lang/String;

    .line 4238
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$43;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getShelfBooksAdapter()Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain;->myNotifyDataSetChanged(Lcom/flyersoft/moonreaderp/ActivityMain$MultiSelect;)V

    .line 4239
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$43;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFavRvAdapter()V

    :cond_0
    return-void
.end method
