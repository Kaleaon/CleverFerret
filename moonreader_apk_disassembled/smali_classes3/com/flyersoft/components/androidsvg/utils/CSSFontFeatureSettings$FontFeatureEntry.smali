.class Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;
.super Ljava/lang/Object;
.source "CSSFontFeatureSettings.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FontFeatureEntry"
.end annotation


# instance fields
.field name:Ljava/lang/String;

.field val:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 146
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;->name:Ljava/lang/String;

    .line 147
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSFontFeatureSettings$FontFeatureEntry;->val:I

    return-void
.end method
