.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

.field final synthetic val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010
        }
        names = {
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

    .line 12920
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iput p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 11

    .line 12922
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    const/4 v2, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 12923
    :goto_0
    const-string v1, ")"

    const-string v3, " ("

    const/4 v4, 0x0

    const-string v5, ""

    if-nez p1, :cond_4

    .line 12925
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v6, :cond_1

    .line 12926
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget-object v6, v6, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    goto :goto_2

    .line 12927
    :cond_1
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v6, :cond_3

    .line 12928
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v7, v7, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v7, v7, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    move-object v7, v5

    goto :goto_1

    :cond_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v8, v8, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_1
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    :cond_3
    move-object v6, v4

    .line 12929
    :goto_2
    iget-object v7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v7, v7, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v7, v6, v2}, Lcom/flyersoft/tools/T;->copyToClipboard(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 12931
    :cond_4
    iget-object v6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v6, v6, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v6, :cond_6

    if-ne p1, v2, :cond_6

    .line 12932
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\""

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12933
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v0, v5

    goto :goto_3

    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v2, v2, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 12934
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 12935
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 12936
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->share_page:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    .line 12937
    invoke-static {v4}, Lcom/flyersoft/tools/BookDb;->getBook(Ljava/lang/String;)Lcom/flyersoft/tools/BookDb$BookInfo;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mgetBookName(Lcom/flyersoft/moonreaderp/ActivityMain;Ljava/lang/String;Lcom/flyersoft/tools/BookDb$BookInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 12936
    const-string v2, "android.intent.extra.SUBJECT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 12938
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 12939
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v0, v5}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 12942
    :cond_6
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-nez v1, :cond_7

    if-eq p1, v2, :cond_8

    :cond_7
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    const/4 v2, 0x2

    if-eqz v1, :cond_a

    if-nez v0, :cond_a

    if-ne p1, v2, :cond_a

    .line 12943
    :cond_8
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz p1, :cond_9

    .line 12944
    new-instance v5, Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v6, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v7, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    new-instance v8, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;

    invoke-direct {v8, p0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;)V

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget p1, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 12951
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-direct/range {v5 .. v10}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V

    return-void

    .line 12952
    :cond_9
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v0, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    if-ne p1, v0, :cond_f

    .line 12953
    new-instance p1, Landroid/widget/EditText;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {p1, v0}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 12954
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 12955
    new-instance v0, Lcom/flyersoft/components/MyDialog;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v0, v1}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 12956
    invoke-virtual {v0, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;

    invoke-direct {v1, p0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1$2;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 12957
    invoke-virtual {v0, p1, v1}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    .line 12965
    invoke-virtual {p1, v0, v4}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 12966
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 12970
    :cond_a
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-nez v1, :cond_b

    if-eq p1, v2, :cond_d

    :cond_b
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v1, :cond_c

    if-eqz v0, :cond_c

    if-eq p1, v2, :cond_d

    :cond_c
    const/4 v0, 0x3

    if-ne p1, v0, :cond_f

    .line 12971
    :cond_d
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz p1, :cond_e

    .line 12972
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)Z

    goto :goto_4

    .line 12974
    :cond_e
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/BookDb;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 12976
    :goto_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Z

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->checked:[Z

    .line 12977
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->this$2:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;->val$position:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->refreshList(I)V

    :cond_f
    return-void
.end method
