.class Lcom/flyersoft/moonreaderp/PrefMisc$109;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->backupProc(Landroid/app/Dialog;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$bookCb:Landroid/widget/CheckBox;

.field final synthetic val$cloudType:I

.field final synthetic val$con:Landroid/content/Context;

.field final synthetic val$coverCb:Landroid/widget/CheckBox;

.field final synthetic val$edit:Landroid/widget/EditText;

.field final synthetic val$fromWhich:I

.field final synthetic val$selfPref:Landroid/app/Dialog;


# direct methods
.method constructor <init>(Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/EditText;ILandroid/content/Context;Landroid/app/Dialog;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2931
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$coverCb:Landroid/widget/CheckBox;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$bookCb:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$edit:Landroid/widget/EditText;

    iput p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$cloudType:I

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    iput-object p6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$selfPref:Landroid/app/Dialog;

    iput p7, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$fromWhich:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 11

    .line 2934
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$coverCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    .line 2935
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$bookCb:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v1

    .line 2936
    sget-boolean p1, Lcom/flyersoft/tools/A;->isProVersion:Z

    if-eqz p1, :cond_0

    const-string p1, ".mrpro"

    goto :goto_0

    :cond_0
    const-string p1, ".mrstd"

    .line 2937
    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2938
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$edit:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 2939
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$cloudType:I

    if-nez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$smcloudTmpBackupFilename()Ljava/lang/String;

    move-result-object p1

    :goto_1
    move-object v5, p1

    .line 2941
    sget-object p1, Lcom/flyersoft/tools/A;->backup_folder:Ljava/lang/String;

    invoke-static {p1}, Lcom/flyersoft/tools/T;->createFolder(Ljava/lang/String;)Z

    .line 2942
    iget p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$cloudType:I

    if-nez p1, :cond_2

    .line 2943
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$selfPref:Landroid/app/Dialog;

    move-object v2, v5

    iget v5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$fromWhich:I

    invoke-static/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupToLocal(ZZLjava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V

    return-void

    .line 2945
    :cond_2
    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$selfPref:Landroid/app/Dialog;

    invoke-static {p2, p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->validateCloud(Landroid/app/Dialog;I)Z

    move-result p1

    if-nez p1, :cond_3

    return-void

    .line 2947
    :cond_3
    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgettmpBooksSize()J

    move-result-wide p1

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgettmpCoversSize()J

    move-result-wide v6

    add-long/2addr p1, v6

    const-wide/32 v6, 0x2faf080

    cmp-long v4, p1, v6

    if-lez v4, :cond_4

    .line 2948
    new-instance p1, Lcom/flyersoft/components/MyDialog;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    invoke-direct {p1, p2}, Lcom/flyersoft/components/MyDialog;-><init>(Landroid/content/Context;)V

    sget p2, Lcom/flyersoft/moonreaderp/R$string;->tip:I

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setTitle(I)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->backup_too_big_to_upload:I

    invoke-virtual {v4, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, " (\u2248"

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgettmpBooksSize()J

    move-result-wide v7

    invoke-static {}, Lcom/flyersoft/moonreaderp/PrefMisc;->-$$Nest$sfgettmpCoversSize()J

    move-result-wide v9

    add-long/2addr v7, v9

    .line 2949
    invoke-static {v6, v7, v8}, Landroid/text/format/Formatter;->formatFileSize(Landroid/content/Context;J)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/flyersoft/tools/T;->greyColorHtml(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 2948
    invoke-static {p2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/flyersoft/components/MyDialog;->setMessage(Ljava/lang/CharSequence;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    move-object v4, v2

    move v2, v0

    new-instance v0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;

    move v3, v1

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;-><init>(Lcom/flyersoft/moonreaderp/PrefMisc$109;ZZLjava/lang/String;Ljava/lang/String;)V

    move-object p2, v1

    const v1, 0x104000a

    .line 2950
    invoke-virtual {p1, v1, v0}, Lcom/flyersoft/components/MyDialog;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/high16 v0, 0x1040000

    const/4 v1, 0x0

    .line 2955
    invoke-virtual {p1, v0, v1}, Lcom/flyersoft/components/MyDialog;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/flyersoft/components/MyDialog;->setCancelable(Z)Lcom/flyersoft/components/MyDialog;

    move-result-object p1

    invoke-virtual {p1}, Lcom/flyersoft/components/MyDialog;->show()Landroidx/appcompat/app/AlertDialog;

    return-void

    :cond_4
    move-object p2, p0

    move-object v4, v2

    move-object v2, v5

    .line 2957
    iget-object p1, p2, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    iget-object v5, p2, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$selfPref:Landroid/app/Dialog;

    iget v6, p2, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$cloudType:I

    move-object v3, v2

    move-object v2, v4

    move-object v4, p1

    invoke-static/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupToCloud(ZZLjava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V

    return-void
.end method
