.class Lcom/flyersoft/moonreaderp/PrefMisc$64;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFolderPick$OnGetFolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->selectSoundFile()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1653
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$64;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFolder(Ljava/lang/String;)V
    .locals 1

    .line 1655
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x5

    .line 1656
    sput v0, Lcom/flyersoft/tools/A;->pageSoundIndex:I

    .line 1657
    sget-object v0, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1658
    sput-object p1, Lcom/flyersoft/tools/A;->pageSoundFile:Ljava/lang/String;

    const/4 p1, 0x0

    .line 1659
    invoke-static {p1, p1}, Lcom/flyersoft/tools/A;->playSound(Landroid/content/Context;Ljava/lang/String;)V

    .line 1660
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$64;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$msetPageSound(Lcom/flyersoft/moonreaderp/PrefMisc;)V

    :cond_0
    return-void
.end method
