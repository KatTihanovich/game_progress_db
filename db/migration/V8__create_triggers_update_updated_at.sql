CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Универсальный триггер для всех таблиц с updated_at
DO $$
DECLARE r RECORD;
BEGIN
  FOR r IN SELECT tablename FROM pg_tables WHERE schemaname = 'public'
  LOOP
    IF EXISTS (SELECT 1 FROM information_schema.columns WHERE table_name=r.tablename AND column_name='updated_at') THEN
      EXECUTE format('CREATE TRIGGER trigger_%I_updated_at BEFORE UPDATE ON %I FOR EACH ROW EXECUTE FUNCTION update_updated_at_column()', r.tablename, r.tablename);
    END IF;
  END LOOP;
END;
$$;
