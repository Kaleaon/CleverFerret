.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->deleteSelectedAnnots()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1669
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 1671
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->getSelectedCount()I

    move-result p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1672
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$6;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->-$$Nest$mdeleteFinal(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V

    if-eqz p1, :cond_2

    .line 1674
    invoke-static {}, Lcom/flyersoft/tools/A;->getHighlights()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookmarks()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-nez p1, :cond_1

    .line 1675
    sget-object p1, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->deleteOtherSameFilenameCacheNotes(Ljava/lang/String;)V

    .line 1676
    :cond_1
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object p2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, "/"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p2, Lcom/flyersoft/tools/A;->lastFile:Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, "_highlight.xml"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1677
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_2

    .line 1678
    invoke-static {p1}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 1680
    :cond_2
    invoke-static {}, Lcom/flyersoft/tools/A;->loadHighlightAllItems()V

    return-void
.end method
