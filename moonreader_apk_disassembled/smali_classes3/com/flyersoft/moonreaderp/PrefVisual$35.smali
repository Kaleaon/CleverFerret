.class Lcom/flyersoft/moonreaderp/PrefVisual$35;
.super Ljava/lang/Object;
.source "PrefVisual.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefVisual;->showFontWeightDialog(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefVisual;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefVisual;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1131
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$35;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFont(Ljava/lang/String;Z)V
    .locals 0

    .line 1134
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$35;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshFontStyle(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1135
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$35;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mrefreshTxtRender(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    .line 1136
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefVisual$35;->this$0:Lcom/flyersoft/moonreaderp/PrefVisual;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefVisual;->-$$Nest$mupdateFontWeightImageAlphaValue(Lcom/flyersoft/moonreaderp/PrefVisual;)V

    return-void
.end method
