.class Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;
.super Ljava/lang/Object;
.source "PrefStatusSetting.java"

# interfaces
.implements Lcom/flyersoft/moonreaderp/PrefFontPick$OnGetFont;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefStatusSetting;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 421
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getFont(Ljava/lang/String;Z)V
    .locals 0

    if-eqz p1, :cond_0

    .line 423
    sget-object p2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_0

    .line 424
    sput-object p1, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    .line 425
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->fontTv:Landroid/widget/TextView;

    sget-object p2, Lcom/flyersoft/tools/A;->statusFontName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 426
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefStatusSetting$20;->this$0:Lcom/flyersoft/moonreaderp/PrefStatusSetting;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefStatusSetting;->-$$Nest$mupdateStatusBarProperties(Lcom/flyersoft/moonreaderp/PrefStatusSetting;)V

    :cond_0
    return-void
.end method
