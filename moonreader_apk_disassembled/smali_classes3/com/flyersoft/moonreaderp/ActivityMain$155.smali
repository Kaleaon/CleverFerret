.class Lcom/flyersoft/moonreaderp/ActivityMain$155;
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

    .line 13916
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 13919
    new-instance p1, Lcom/flyersoft/moonreaderp/PrefFolderPick;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$155;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->my_files_favorites_list:I

    invoke-virtual {p2, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/flyersoft/tools/A;->lastPath:Ljava/lang/String;

    new-instance v2, Lcom/flyersoft/moonreaderp/ActivityMain$155$1;

    invoke-direct {v2, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$155$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$155;)V

    invoke-direct {p1, p2, v0, v1, v2}, Lcom/flyersoft/moonreaderp/PrefFolderPick;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;)V

    .line 13929
    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefFolderPick;->show()V

    return-void
.end method
