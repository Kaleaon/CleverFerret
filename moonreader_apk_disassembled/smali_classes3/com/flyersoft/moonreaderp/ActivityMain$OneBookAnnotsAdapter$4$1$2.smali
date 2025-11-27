.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

.field final synthetic val$et:Landroid/widget/EditText;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;Landroid/widget/EditText;)V
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

    .line 12957
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->val$et:Landroid/widget/EditText;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 12959
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->val$et:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    .line 12960
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 12961
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->insertNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)J

    .line 12962
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;->this$3:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->refreshList(I)V

    return-void
.end method
