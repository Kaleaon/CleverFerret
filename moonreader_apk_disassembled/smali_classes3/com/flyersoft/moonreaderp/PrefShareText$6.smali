.class Lcom/flyersoft/moonreaderp/PrefShareText$6;
.super Ljava/lang/Object;
.source "PrefShareText.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefShareText;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

.field final synthetic val$authorCb:Landroid/widget/CheckBox;

.field final synthetic val$chapterCb:Landroid/widget/CheckBox;

.field final synthetic val$titleCb:Landroid/widget/CheckBox;

.field final synthetic val$value:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefShareText;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
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

    .line 480
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$titleCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$authorCb:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$chapterCb:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$value:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 483
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$titleCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    .line 484
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$authorCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    .line 485
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$chapterCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    .line 486
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-boolean p2, Lcom/flyersoft/tools/A;->shareTextTitle:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string p2, ":"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean v0, Lcom/flyersoft/tools/A;->shareTextAuthor:Z

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-boolean p2, Lcom/flyersoft/tools/A;->shareTextChapter:Z

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 487
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->val$value:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_0

    .line 488
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate1(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 489
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate2(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 490
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate3(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 491
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateTemplate4(Lcom/flyersoft/moonreaderp/PrefShareText;Z)V

    .line 492
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/flyersoft/moonreaderp/PrefShareText;->eraseGPUShadow(Z)V

    .line 493
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefShareText$6;->this$0:Lcom/flyersoft/moonreaderp/PrefShareText;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefShareText;->-$$Nest$mcreateBitmaps(Lcom/flyersoft/moonreaderp/PrefShareText;)V

    :cond_0
    return-void
.end method
