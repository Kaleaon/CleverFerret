.class Lcom/flyersoft/moonreaderp/ActivityMain$156;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showFavFolderSelector()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$checked:[Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;[Z)V
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

    .line 13903
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 13905
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    const/4 p2, 0x0

    aget-boolean p1, p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->showDropboxInLocalFiles:Z

    .line 13906
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    const/4 p2, 0x1

    aget-boolean p1, p1, p2

    sput-boolean p1, Lcom/flyersoft/tools/A;->showGdriveInLocalFiles:Z

    .line 13907
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    const/4 v0, 0x2

    aget-boolean p1, p1, v0

    sput-boolean p1, Lcom/flyersoft/tools/A;->showWebDavInLocalFiles:Z

    .line 13908
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    const/4 v0, 0x3

    aget-boolean p1, p1, v0

    sput-boolean p1, Lcom/flyersoft/tools/A;->showFtpInLocalFiles:Z

    .line 13909
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    array-length p1, p1

    sub-int/2addr p1, p2

    :goto_0
    const/4 p2, 0x4

    if-lt p1, p2, :cond_1

    .line 13910
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->val$checked:[Z

    aget-boolean p2, p2, p1

    if-nez p2, :cond_0

    .line 13911
    invoke-static {}, Lcom/flyersoft/tools/A;->getFavFolders()Ljava/util/ArrayList;

    move-result-object p2

    add-int/lit8 v0, p1, -0x4

    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    .line 13912
    :cond_1
    invoke-static {}, Lcom/flyersoft/tools/A;->saveFavFolders()Z

    .line 13913
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$156;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateFilesRvAdapter()V

    return-void
.end method
