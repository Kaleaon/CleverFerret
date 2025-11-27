.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/components/MyMenu$MenuItemClick;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

.field final synthetic val$items:[Ljava/lang/String;

.field final synthetic val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;[Ljava/lang/String;I)V
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

    .line 1533
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$items:[Ljava/lang/String;

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$position:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(I)V
    .locals 11

    const/4 v0, 0x0

    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    .line 1535
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    if-ne v2, v3, :cond_2

    .line 1536
    :cond_0
    sget-object p1, Lcom/flyersoft/tools/A;->readWiseToken:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->isNull(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 1537
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, v0}, Lcom/flyersoft/components/Readwise;->showOption(Landroid/content/Context;Landroid/widget/CheckBox;)V

    return-void

    .line 1539
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {v1}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " -> Readwise"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 1540
    new-instance v1, Lcom/flyersoft/components/Readwise$WiseItem;

    .line 1541
    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookAuthor()Ljava/lang/String;

    move-result-object v3

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v4, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v5, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    .line 1542
    invoke-static {p1}, Lcom/flyersoft/components/Readwise;->getChapterName(Lcom/flyersoft/tools/BookDb$NoteInfo;)Ljava/lang/String;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/components/Readwise$WiseItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;

    invoke-direct {p1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;)V

    .line 1540
    invoke-static {v1, p1}, Lcom/flyersoft/components/Readwise;->addHighlight(Lcom/flyersoft/components/Readwise$WiseItem;Lcom/flyersoft/components/Readwise$UploadResult;)V

    return-void

    .line 1555
    :cond_2
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-ne v2, v3, :cond_3

    const/4 v2, 0x1

    goto :goto_0

    :cond_3
    const/4 v2, 0x0

    .line 1556
    :goto_0
    const-string v3, ")"

    const-string v6, " ("

    const-string v7, ""

    if-nez p1, :cond_7

    .line 1558
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz v8, :cond_4

    .line 1559
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget-object v8, v8, Lcom/flyersoft/tools/A$Bookmark;->name:Ljava/lang/String;

    goto :goto_2

    .line 1560
    :cond_4
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v8, :cond_6

    .line 1561
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v9, v9, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v9, v9, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    move-object v9, v7

    goto :goto_1

    :cond_5
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v10, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v10, v10, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v10, v10, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_1
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    :cond_6
    move-object v8, v0

    .line 1562
    :goto_2
    iget-object v9, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v9, v9, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v9}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-static {v9, v8, v5}, Lcom/flyersoft/tools/T;->copyToClipboard(Landroid/content/Context;Ljava/lang/String;Z)V

    .line 1564
    :cond_7
    iget-object v8, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v8, v8, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v8, :cond_9

    if-ne p1, v5, :cond_9

    .line 1565
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "\""

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1566
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v0, v0, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8

    move-object v0, v7

    goto :goto_3

    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1567
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.SEND"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1568
    const-string v1, "text/plain"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 1569
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->share_page:I

    invoke-static {v2}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lcom/flyersoft/tools/A;->getBookName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.intent.extra.SUBJECT"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1570
    const-string v1, "android.intent.extra.TEXT"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1571
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v0, v7}, Landroid/content/Intent;->createChooser(Landroid/content/Intent;Ljava/lang/CharSequence;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void

    .line 1574
    :cond_9
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-nez v3, :cond_a

    if-eq p1, v5, :cond_b

    :cond_a
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    if-eqz v3, :cond_d

    if-nez v2, :cond_d

    const/4 v2, 0x3

    if-ne p1, v2, :cond_d

    .line 1575
    :cond_b
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz p1, :cond_c

    .line 1576
    new-instance v1, Lcom/flyersoft/moonreaderp/PrefEditBookmark;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v3, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->name:Ljava/lang/String;

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;

    invoke-direct {v4, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;)V

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    iget p1, p1, Lcom/flyersoft/tools/A$Bookmark;->color:I

    .line 1585
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v6

    invoke-direct/range {v1 .. v6}, Lcom/flyersoft/moonreaderp/PrefEditBookmark;-><init>(Landroid/content/Context;Ljava/lang/String;Lcom/flyersoft/moonreaderp/PrefEditBookmark$OnAfterEdit;Ljava/lang/Integer;Landroid/view/View;)V

    return-void

    .line 1586
    :cond_c
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v1, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    if-ne p1, v1, :cond_11

    .line 1587
    new-instance p1, Landroid/widget/EditText;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p1, v1}, Landroid/widget/EditText;-><init>(Landroid/content/Context;)V

    .line 1588
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object v1, v1, Lcom/flyersoft/tools/BookDb$NoteInfo;->noteText:Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 1589
    new-instance v1, Lcom/flyersoft/components/MyDialog;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v2}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    .line 1590
    invoke-virtual {v1, p1}, Lcom/flyersoft/components/MyDialog;->setView(Landroid/view/View;)Lcom/flyersoft/components/MyDialog;

    move-result-object v1

    new-instance v2, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;

    invoke-direct {v2, p0, p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$4;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;Landroid/widget/EditText;)V

    const p1, 0x104000a

    .line 1591
    invoke-virtual {v1, p1, v2}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v1, 0x1040000

    .line 1607
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$3;

    invoke-direct {v0, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$3;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;)V

    .line 1608
    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    .line 1614
    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    .line 1618
    :cond_d
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$items:[Ljava/lang/String;

    array-length v2, v0

    sub-int/2addr v2, v1

    if-ne p1, v2, :cond_f

    .line 1619
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    if-eqz p1, :cond_e

    .line 1621
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->bookmarkItem:Lcom/flyersoft/tools/A$Bookmark;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->removeBookmark(Lcom/flyersoft/tools/A$Bookmark;)V

    goto :goto_4

    .line 1623
    :cond_e
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->removeNote(Lcom/flyersoft/tools/BookDb$NoteInfo;)Z

    .line 1624
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$n:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->note:Lcom/flyersoft/tools/BookDb$NoteInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$NoteInfo;->original:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->getHighlightAllItem(Ljava/lang/String;)Lcom/flyersoft/tools/A$HighlightAll;

    move-result-object p1

    invoke-static {p1, v5}, Lcom/flyersoft/tools/A;->deleteHighlightAllItem(Lcom/flyersoft/tools/A$HighlightAll;Z)V

    .line 1626
    :goto_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->val$position:I

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->refreshList(I)V

    .line 1627
    sput-boolean v5, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 1628
    sput-boolean v5, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    return-void

    .line 1631
    :cond_f
    array-length v0, v0

    sub-int/2addr v0, v5

    if-ne p1, v0, :cond_11

    .line 1632
    :goto_5
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    array-length p1, p1

    if-ge v4, p1, :cond_10

    .line 1633
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->checked:[Z

    aput-boolean v5, p1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_5

    .line 1634
    :cond_10
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$msetNoteDeleteVisble(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 1635
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyDataSetChanged()V

    :cond_11
    return-void
.end method
