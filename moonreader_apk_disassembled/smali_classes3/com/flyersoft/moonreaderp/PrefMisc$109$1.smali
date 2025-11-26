.class Lcom/flyersoft/moonreaderp/PrefMisc$109$1;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc$109;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc$109;

.field final synthetic val$backupTo:Ljava/lang/String;

.field final synthetic val$includeBooks:Z

.field final synthetic val$includeCovers:Z

.field final synthetic val$uploadFilename:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc$109;ZZLjava/lang/String;Ljava/lang/String;)V
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

    .line 2950
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$109;

    iput-boolean p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$includeCovers:Z

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$includeBooks:Z

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$uploadFilename:Ljava/lang/String;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$backupTo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 7

    .line 2953
    iget-boolean v0, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$includeCovers:Z

    iget-boolean v1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$includeBooks:Z

    iget-object v2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$uploadFilename:Ljava/lang/String;

    iget-object v3, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->val$backupTo:Ljava/lang/String;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$109;

    iget-object v4, p1, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$con:Landroid/content/Context;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$109;

    iget-object v5, p1, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$selfPref:Landroid/app/Dialog;

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$109$1;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc$109;

    iget v6, p1, Lcom/flyersoft/moonreaderp/PrefMisc$109;->val$cloudType:I

    invoke-static/range {v0 .. v6}, Lcom/flyersoft/moonreaderp/PrefMisc;->backupToCloud(ZZLjava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/app/Dialog;I)V

    return-void
.end method
