.class Lcom/flyersoft/moonreaderp/PrefMisc$116;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->showBackupSuccessInfo(Ljava/lang/String;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$backupTo:Ljava/lang/String;

.field final synthetic val$con:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3133
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$116;->val$con:Landroid/content/Context;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$116;->val$backupTo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 3136
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$116;->val$con:Landroid/content/Context;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefMisc$116;->val$backupTo:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/flyersoft/tools/A;->sendFile(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method
