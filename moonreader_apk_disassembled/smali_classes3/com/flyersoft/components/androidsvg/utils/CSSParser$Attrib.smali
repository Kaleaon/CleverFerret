.class Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;
.super Ljava/lang/Object;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Attrib"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field final operation:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

.field public final value:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;Ljava/lang/String;)V
    .locals 0

    .line 157
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->name:Ljava/lang/String;

    .line 159
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->operation:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    .line 160
    iput-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$Attrib;->value:Ljava/lang/String;

    return-void
.end method
