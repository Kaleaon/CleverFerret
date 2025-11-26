.class Lcom/flyersoft/moonreaderp/PrefAbout$3;
.super Ljava/lang/Object;
.source "PrefAbout.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefAbout;->showDonation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefAbout;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefAbout;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 267
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefAbout$3;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    .line 270
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=101&amount=1&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    if-ne p2, v0, :cond_1

    .line 271
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=102&amount=5&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    goto :goto_0

    :cond_1
    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    .line 272
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=103&amount=10&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    goto :goto_0

    :cond_2
    const/4 v0, 0x4

    if-ne p2, v0, :cond_3

    .line 273
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=104&amount=50&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    goto :goto_0

    :cond_3
    const/4 v0, 0x5

    if-ne p2, v0, :cond_4

    .line 274
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=105&amount=100&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    goto :goto_0

    .line 275
    :cond_4
    const-string p2, "https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=seanyword@gmail.com&item_name=Moon%2B+Reader+Pro&item_number=100&amount=&no_shipping=0&no_note=1&currency_code=USD&lc=us"

    .line 276
    :goto_0
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefAbout$3;->this$0:Lcom/flyersoft/moonreaderp/PrefAbout;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefAbout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p2}, Lcom/flyersoft/tools/T;->openUrl(Landroid/content/Context;Ljava/lang/String;)V

    .line 277
    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method
