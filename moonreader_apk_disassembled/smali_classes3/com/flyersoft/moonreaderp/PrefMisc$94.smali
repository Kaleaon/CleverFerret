.class Lcom/flyersoft/moonreaderp/PrefMisc$94;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->restoreProc_second(Landroid/app/Dialog;ILjava/util/ArrayList;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$backups:[Ljava/lang/String;


# direct methods
.method constructor <init>([Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 2406
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$94;->val$backups:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 2408
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$94;->val$backups:[Ljava/lang/String;

    aget-object p1, p1, p2

    const-string p2, " (std)"

    const-string v0, ".mrstd"

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string p2, " (pro)"

    const-string v0, ".mrpro"

    invoke-virtual {p1, p2, v0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    sput-object p1, Lcom/flyersoft/moonreaderp/PrefMisc;->selectedBackup:Ljava/lang/String;

    return-void
.end method
