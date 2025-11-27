.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;
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

    .line 12866
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    .line 12868
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 12869
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    return-void

    .line 12871
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->isSelectedState:Z

    if-eqz v0, :cond_1

    .line 12872
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-virtual {v0, p1}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->inverseChecked(I)V

    return-void

    .line 12875
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 12876
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    invoke-static {v0}, Lcom/flyersoft/tools/T;->isFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 12877
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "\""

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\" "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v3, Lcom/flyersoft/moonreaderp/R$string;->not_exists:I

    invoke-virtual {v2, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/flyersoft/tools/T;->showAlertText(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    return-void

    .line 12879
    :cond_2
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-boolean v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;->annotUpdated:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_3

    .line 12880
    sput-boolean v1, Lcom/flyersoft/tools/A;->hasNewNoteForUpload:Z

    .line 12881
    :cond_3
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const-class v3, Lcom/flyersoft/moonreaderp/ActivityTxt;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 12882
    iget-object v2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v2, v2, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    const-string v3, "bookFile"

    invoke-virtual {v0, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 12883
    iget-wide v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->position:J

    .line 12884
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getBookType(Ljava/lang/String;)I

    move-result v4

    const/4 v5, 0x7

    if-ne v4, v5, :cond_5

    .line 12885
    iget v4, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    .line 12886
    iget v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    :goto_0
    int-to-long v2, v2

    goto :goto_1

    .line 12887
    :cond_4
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->filename:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".djvu"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 12888
    iget v2, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    goto :goto_0

    .line 12890
    :cond_5
    :goto_1
    const-string v4, "position"

    invoke-virtual {v0, v4, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 12891
    const-string v2, "chapter"

    iget v3, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->chapter:I

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 12892
    const-string v2, "splitIndex"

    iget p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->splitIndex:I

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 12893
    const-string p1, "fromMain"

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 12894
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$3;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
