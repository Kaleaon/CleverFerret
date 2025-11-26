.class Lcom/flyersoft/moonreaderp/PrefMisc$105$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$105;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$105;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$105;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 2858
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$105;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 3

    .line 2860
    check-cast p1, Landroidx/appcompat/app/AlertDialog;

    invoke-virtual {p1}, Landroidx/appcompat/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ListView;->getCheckedItemPosition()I

    move-result p1

    sput p1, Lcom/flyersoft/tools/A;->autobackupType:I

    .line 2861
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$105;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$autoCb:Landroid/widget/CheckBox;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$105;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$con:Landroid/content/Context;

    sget v1, Lcom/flyersoft/moonreaderp/R$string;->auto_backup:I

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2862
    sget v0, Lcom/flyersoft/tools/A;->autobackupCloud:I

    const-string v1, " | "

    if-lez v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget v2, Lcom/flyersoft/tools/A;->autobackupCloud:I

    invoke-static {v2}, Lcom/flyersoft/components/cloud/Cloud;->getCloudName(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, ""

    :goto_0
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$105$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$105;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefMisc$105;->val$timeRange:[Ljava/lang/String;

    sget v1, Lcom/flyersoft/tools/A;->autobackupType:I

    aget-object v0, v0, v1

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2861
    invoke-virtual {p1, p2}, Landroid/widget/CheckBox;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
