.class Lcom/flyersoft/moonreaderp/ActivityMain$114$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$114;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$114;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$114;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 9916
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$114$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$114;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 9918
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 9919
    sget-object p1, Lcom/flyersoft/tools/A;->default_book_folder:Ljava/lang/String;

    .line 9920
    :cond_0
    sput-object p1, Lcom/flyersoft/tools/A;->scanPath:Ljava/lang/String;

    .line 9921
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$114$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$114;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$114;->val$et:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
