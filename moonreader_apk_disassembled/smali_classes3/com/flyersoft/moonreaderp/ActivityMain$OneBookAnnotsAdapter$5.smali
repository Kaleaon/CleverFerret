.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->deleteSelectedAnnots()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 13003
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 13005
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->getSelectedCount()I

    move-result p1

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p2, p2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    array-length p2, p2

    if-ne p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 13006
    :goto_0
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-static {p2}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->-$$Nest$mdeleteFinal(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V

    if-eqz p1, :cond_1

    .line 13008
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotKey:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->annotFilter:I

    if-nez p1, :cond_1

    .line 13009
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$5;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->deleteOtherSameFilenameCacheNotes(Ljava/lang/String;)V

    :cond_1
    return-void
.end method
