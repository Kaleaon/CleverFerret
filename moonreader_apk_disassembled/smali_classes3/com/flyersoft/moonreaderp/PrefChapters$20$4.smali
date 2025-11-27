.class Lcom/flyersoft/moonreaderp/PrefChapters$20$4;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFilePick$OnGetFile;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$20;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$20;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1876
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGetFile(Ljava/lang/String;)V
    .locals 4

    .line 1880
    invoke-static {p1}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    .line 1881
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$bookFile:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/flyersoft/tools/BookDb;->importNotesFromFile(Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v1, 0x2

    if-ne p1, v1, :cond_4

    .line 1883
    :cond_0
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBookmarks(Z)Ljava/util/ArrayList;

    .line 1884
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-boolean v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$fromMain:Z

    if-eqz v1, :cond_1

    .line 1885
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->isNull(Landroid/app/Activity;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 1886
    sget-object v1, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->refreshAnnotList()V

    goto :goto_0

    .line 1887
    :cond_1
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz v1, :cond_3

    .line 1888
    sput-boolean v0, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 1889
    sput-boolean v0, Lcom/flyersoft/tools/A;->lastFileAnnotUpdated:Z

    .line 1890
    invoke-static {v0}, Lcom/flyersoft/tools/A;->checkNotesHighlights(Z)V

    .line 1891
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    .line 1892
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v1, :cond_2

    .line 1893
    sget-object v1, Lcom/flyersoft/tools/A;->txtView:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1894
    :cond_2
    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    if-eqz v1, :cond_3

    .line 1895
    sget-object v1, Lcom/flyersoft/tools/A;->txtView2:Lcom/flyersoft/staticlayout/MRTextView;

    invoke-virtual {v1}, Lcom/flyersoft/staticlayout/MRTextView;->postInvalidate()V

    .line 1897
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->import_success:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    .line 1898
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz v1, :cond_4

    .line 1899
    sget-object v1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mbookmarkTipVisible(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    :cond_4
    const/4 v1, -0x1

    if-ne p1, v1, :cond_5

    .line 1902
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->import_failed:I

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    :cond_5
    const/4 v1, -0x2

    if-ne p1, v1, :cond_6

    .line 1904
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->import_not_same_file:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1, v0}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    :cond_6
    return-void

    .line 1906
    :cond_7
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$4;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$20;->val$context:Landroid/content/Context;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    .line 1907
    invoke-virtual {p1, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1906
    invoke-static {v0, v1, p1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void
.end method
