.class Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

.field final synthetic val$filename:Ljava/lang/String;

.field final synthetic val$fromDashBoard:Z

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$135$1;Ljava/lang/String;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 12609
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$filename:Ljava/lang/String;

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$fromDashBoard:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 12611
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->clearBookmarks(Ljava/lang/String;)V

    .line 12612
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$filename:Ljava/lang/String;

    const/4 p2, 0x0

    invoke-static {p1, p2, p2}, Lcom/flyersoft/tools/BookDb;->deleteNotes(Ljava/lang/String;ZZ)V

    .line 12613
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$filename:Ljava/lang/String;

    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    .line 12614
    sput-boolean p1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 12615
    :cond_0
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$fromDashBoard:Z

    if-nez p1, :cond_1

    .line 12616
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotBooks:Ljava/util/ArrayList;

    iget p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->val$position:I

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 12617
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateBookmarkRvAdapter()V

    .line 12618
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$135$1$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$135$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135$1;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$135;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$135;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->refreshAnnotList()V

    return-void
.end method
