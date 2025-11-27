.class Lcom/flyersoft/moonreaderp/PrefMisc$42;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->setPageSound()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefMisc;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefMisc;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1179
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$42;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    const/4 p1, 0x5

    if-ne p2, p1, :cond_0

    .line 1183
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$42;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->selectSoundFile()V

    return-void

    .line 1185
    :cond_0
    sput p2, Lcom/flyersoft/tools/A;->pageSoundIndex:I

    .line 1186
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefMisc$42;->this$0:Lcom/flyersoft/moonreaderp/PrefMisc;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefMisc;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->playPageSound(Landroid/content/Context;)V

    return-void
.end method
