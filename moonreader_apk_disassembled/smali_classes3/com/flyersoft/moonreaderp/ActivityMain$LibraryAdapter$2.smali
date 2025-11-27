.class Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 6246
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 6249
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 6250
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p1, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->lastLibIndex:I

    .line 6251
    invoke-static {}, Lcom/flyersoft/opds/N;->getLibraries()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/opds/OpdsSite;

    .line 6252
    iget-object v0, p1, Lcom/flyersoft/opds/OpdsSite;->mainUrl:Ljava/lang/String;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 6254
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$LibraryAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mopenLibrary(Lcom/flyersoft/moonreaderp/ActivityMain;Lcom/flyersoft/opds/OpdsSite;)V

    return-void
.end method
