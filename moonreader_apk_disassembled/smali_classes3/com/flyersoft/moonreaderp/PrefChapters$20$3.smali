.class Lcom/flyersoft/moonreaderp/PrefChapters$20$3;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


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

    .line 1909
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$20$3;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters$20;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    .line 1912
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    if-eqz p1, :cond_0

    .line 1913
    sget-object p1, Lcom/flyersoft/moonreaderp/PrefChapters;->selfPref:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    :cond_0
    return-void
.end method
