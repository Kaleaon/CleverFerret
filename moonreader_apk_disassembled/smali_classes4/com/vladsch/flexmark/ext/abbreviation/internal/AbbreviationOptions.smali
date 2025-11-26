.class public Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;
.super Ljava/lang/Object;
.source "AbbreviationOptions.java"


# instance fields
.field protected final useLinks:Z


# direct methods
.method public constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    sget-object v0, Lcom/vladsch/flexmark/ext/abbreviation/AbbreviationExtension;->USE_LINKS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {v0, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iput-boolean p1, p0, Lcom/vladsch/flexmark/ext/abbreviation/internal/AbbreviationOptions;->useLinks:Z

    return-void
.end method
