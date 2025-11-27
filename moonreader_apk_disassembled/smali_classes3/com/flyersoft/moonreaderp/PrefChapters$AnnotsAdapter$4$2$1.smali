.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Lcom/flyersoft/components/Readwise$UploadResult;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->onClick(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1542
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public done(ZLjava/lang/String;I)V
    .locals 3

    if-nez p1, :cond_0

    .line 1546
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v1

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->error:I

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " | "

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    invoke-static {p1, p2, p3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void

    .line 1548
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2$1;->this$3:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;->this$2:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    const-string p2, "OK!"

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void
.end method
